require 'spec_helper'

describe MoviesController do
  describe 'add director' do
    before :each do
      @m=mock(Movie, :title => "Star Wars", :director => "director", :id => "1")
      Movie.stub!(:find).with("1").and_return(@m)
    end
    it 'should call update_attributes and redirect' do
      @m.stub!(:update_attributes!).and_return(true)
      put :update, {:id => "1", :movie => @m}
      response.should redirect_to(movie_path(@m))
    end
  end

    context "Sad path: the director field is empty" do
      it 'find the director field is empty' do
        @movie = FactoryGirl.create(:movie, title: 'Jacy and Pierre learn Rails', director:nil)
        expect(Movie.find_similar(@movie.id)).to be_nil
      end
    end
  end