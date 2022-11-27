class ApplicationController < ActionController::Base
    def index
        render :json => { hoge: "fuga" }
    end

    def sleep_seconds
        sleep params[:seconds].to_i
        render :json => { message: "#{params[:seconds]} seconds slept."}
    end
end
