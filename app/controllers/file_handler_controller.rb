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

  GetFilePartialResult = Struct.new(:Result,:MoreChunk,:Data)
  def getfilepartial
    
  	file =  open(File.join(Rails.root,"app/assets/" + params[:filename]), "rb")
    p = params[:position].to_i
    file.seek(p,IO::SEEK_SET)
    contents =  file.read(1024)
    morechunk = !file.eof
    contents = Base64.encode64(contents)

    respond_to do |format|
        format.json { render json: GetFilePartialResult.new(0,morechunk,contents) }
    end
  	
  end

  GetFilePartialResult = Struct.new(:Result,:MoreChunk,:Data)
  def DownloadCourse

    file =  open(File.join(Rails.root,"app/assets/" + params[:courseid]+".zip"), "rb")
    p = params[:position].to_i
    file.seek(p,IO::SEEK_SET)
    contents =  file.read(10240)
    morechunk = !file.eof
    contents = Base64.encode64(contents)

    respond_to do |format|
        format.json { render json: GetFilePartialResult.new(0,morechunk,contents) }
    end

  end

end
