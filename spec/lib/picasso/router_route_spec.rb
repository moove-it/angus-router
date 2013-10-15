require 'spec_helper'

require 'lib/picasso/router'

describe Picasso::Router::Route do
  subject(:route) do
    path_pattern = Picasso::Router::PathPattern.new(/[a-z]/, [])

    Picasso::Router::Route.new('POST', -> {}, path_pattern)
  end

  describe '#match' do
    it 'matches the given path' do
      route.match('/route').should be
    end
  end

  describe '#params?' do
    context 'when params' do
      let(:params) { Picasso::Router::PathPattern.new(//, [:id]) }
      let(:route) { Picasso::Router::Route.new(:get, -> {}, params) }

      it 'is true' do
        route.params?.should be
      end
    end

    context 'when no params' do
      let(:params) { Picasso::Router::PathPattern.new(//, []) }
      let(:route) { Picasso::Router::Route.new(:get, -> {}, params) }

      it 'is false' do
        route.params?.should_not be
      end
    end
  end
end
