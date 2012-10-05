class FileHandlerController < ApplicationController

  def new
  end

  GetMyFileResult = Struct.new(:resultcode,:filecontent)
  def getmyfile
  	
  	#s = Base64.encode64(File.read(File.join(Rails.root,"app/assets/testfile.txt"))) 
    contents = open(File.join(Rails.root,"app/assets/" + params[:filename]), "rb") {|io| io.read }

    contents = Base64.encode64(contents)
    respond_to do |format|
        format.json { render json: GetMyFileResult.new(0,contents) }
    end
  end
end
