require "spec_helper"

feature "visitor navigates site" do
  it "shows the featured image on the home page" do
    category = create(:category)
    photo = create(:photo, featured: true, categories: [category])

    visit root_path
    expect(page).to have_selector("a[data-id='#{photo.id}']")
  end

  it "increments the view counter when an image is displayed", js: true do
    category = create(:category)
    photo = create(:photo, featured: true, categories: [category])

    visit root_path

    selector = "a[data-id='#{photo.id}']"

    page.find(selector).click

    expect(page).to have_selector("img.fancybox-image")

    wait_for_ajax
    photo.reload

    expect(photo.views).to eq(1)
  end

  it "shows the categories" do
    categories = create_list(:category, 5)

    visit root_path
    click_link "portfolio"

    expect(page).to have_link(categories.first.name.downcase)

    click_link "→"

    expect(page).to have_link(categories.last.name.downcase)
  end

  it "shows the photos for the category" do
    category = create(:category)
    photo = create(:photo, featured: true, categories: [category])

    visit categories_path

    click_link category.name.downcase

    selector = "a[data-id='#{photo.id}']"
    expect(page).to have_selector(selector)
  end

  it "shows the second page of photos" do
    category = create(:category)
    photos = create_list(:photo, 12, featured: true, categories: [category])

    visit url_for([category, :photos])

    click_link "→"

    selector = "a[data-id='#{photos.last.id}']"
    expect(page).to have_selector(selector)
  end
end
