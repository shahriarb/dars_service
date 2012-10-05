class FileHandlerController < ApplicationController

  def new
  end

  GetMyFileResult = Struct.new(:resultcode,:filecontent)
  def getmyfile
  	
  	s = Base64.encode64(File.read(File.join(Rails.root,"app/assets/testfile.txt"))) 
    

    respond_to do |format|
        format.json { render json: GetMyFileResult.new(0,s) }
    end
  end
end
