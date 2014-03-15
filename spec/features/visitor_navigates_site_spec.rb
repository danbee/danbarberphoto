require 'spec_helper'

describe 'visitor navigates site' do

  let!(:category) { create(:category) }
  let!(:photo) { create(:photo, featured: true, categories: [category]) }

  it 'shows the featured image on the home page' do
    visit root_path
    expect(page).to have_selector("a[data-id='#{photo.id}']")
  end

  it 'increments the view counter when an image is displayed', js: true do
    visit root_path

    selector = "a[data-id='#{photo.id}']"
    expect(page).to have_selector(selector)

    page.find(selector).click

    expect(page).to have_selector('img.fancybox-image')

    wait_for_ajax
    photo.reload

    expect(photo.views).to eq(1)
  end

  it 'shows the categories' do
    visit root_path

    click_link 'portfolio'

    expect(page).to have_link(category.name.downcase)
  end

  it 'shows the photos for the category' do
    visit categories_path

    click_link category.name.downcase

    selector = "a[data-id='#{photo.id}']"
    expect(page).to have_selector(selector)
  end
end
