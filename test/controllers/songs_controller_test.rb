require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    get songs_url
    assert_response :success
  end

  test "should get new" do
    get new_song_url
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post songs_url, params: { song: { audio: @song.audio, description: @song.description, lyricsbody1: @song.lyricsbody1, lyricsbody2: @song.lyricsbody2, lyricsbody3: @song.lyricsbody3, lyricschorus1: @song.lyricschorus1, lyricschorus2: @song.lyricschorus2, lyricschorus3: @song.lyricschorus3, lyricstitle: @song.lyricstitle, slug: @song.slug, songcover: @song.songcover, title: @song.title, youtubeurl: @song.youtubeurl } }
    end

    assert_redirected_to song_url(Song.last)
  end

  test "should show song" do
    get song_url(@song)
    assert_response :success
  end

  test "should get edit" do
    get edit_song_url(@song)
    assert_response :success
  end

  test "should update song" do
    patch song_url(@song), params: { song: { audio: @song.audio, description: @song.description, lyricsbody1: @song.lyricsbody1, lyricsbody2: @song.lyricsbody2, lyricsbody3: @song.lyricsbody3, lyricschorus1: @song.lyricschorus1, lyricschorus2: @song.lyricschorus2, lyricschorus3: @song.lyricschorus3, lyricstitle: @song.lyricstitle, slug: @song.slug, songcover: @song.songcover, title: @song.title, youtubeurl: @song.youtubeurl } }
    assert_redirected_to song_url(@song)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
