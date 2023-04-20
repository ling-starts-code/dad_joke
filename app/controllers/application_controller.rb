class ApplicationController < ActionController::Base
    def hello
        render html: "hello, Jokes!"
      end
end
