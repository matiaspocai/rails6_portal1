require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "creating a Article" do
    visit articles_url
    click_on "New Article"

    fill_in "Autor", with: @article.autor
    fill_in "Bajada", with: @article.bajada
    fill_in "Cuerpo", with: @article.cuerpo
    fill_in "Publicado", with: @article.publicado
    fill_in "Seccion", with: @article.seccion
    fill_in "Titulo", with: @article.titulo
    fill_in "Ubicacion", with: @article.ubicacion
    fill_in "Volanta", with: @article.volanta
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "updating a Article" do
    visit articles_url
    click_on "Edit", match: :first

    fill_in "Autor", with: @article.autor
    fill_in "Bajada", with: @article.bajada
    fill_in "Cuerpo", with: @article.cuerpo
    fill_in "Publicado", with: @article.publicado
    fill_in "Seccion", with: @article.seccion
    fill_in "Titulo", with: @article.titulo
    fill_in "Ubicacion", with: @article.ubicacion
    fill_in "Volanta", with: @article.volanta
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "destroying a Article" do
    visit articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article was successfully destroyed"
  end
end
