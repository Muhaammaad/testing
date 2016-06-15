class PagesController < ApplicationController
  def home
  	if user_signed_in?

  	if current_user.admin
  		redirect_to action: :admin
  	else redirect_to action: :doc
  	end
end
  end
  def admin

        search_val = params[:search_val] || ""
  q = "%#{params[:search_val]}%"
search_type= params[:search_type] || ""
  r = "%#{params[:search_type]}%"
#  byebug
  puts params[:search_type]
  if(params[:search_type]=="first_name")
  @pdetail = Pdetail.where('first_name LIKE ?', q)
elsif(params[:search_type]=="age")
  @pdetail = Pdetail.where('age LIKE ?', q)

elsif(params[:search_type]=="male")
  @pdetail = Pdetail.where('male LIKE ?',q)
elsif(params[:search_type]=="male"  )
  @pdetail = Pdetail.where('male LIKE false')
elsif (params[:search_type]=="sort")
    @pdetail = Pdetail.order(first_name: :desc)
else
  @pdetail = Pdetail.where('first_name LIKE ?', q)
end
    #@pdetail= current_user.histori es
    respond_to do |format|
      format.html
      format.xml { render :xml => @pdetail.to_xml }
      format.json { render :json => @pdetail.to_json }
    end
  end
  def doc
  	search_val = params[:search_val] || ""
	q = "%#{params[:search_val]}%"
search_type= params[:search_type] || ""
  r = "%#{params[:search_type]}%"
#  byebug
  puts params[:search_type]
  if(params[:search_type]=="first_name")
	@pdetail = Pdetail.where('first_name LIKE ?', q)
elsif(params[:search_type]=="age")
  @pdetail = Pdetail.where('age LIKE ?', q)

elsif(params[:search_type]=="male")
  @pdetail = Pdetail.where('male LIKE ?',q)
elsif(params[:search_type]=="male"  )
  @pdetail = Pdetail.where('male LIKE false')
elsif (params[:search_type]=="sort")
    @pdetail = Pdetail.order(first_name: :desc)
else
  @pdetail = Pdetail.where('first_name LIKE ?', q)
end
  	respond_to do |format|
      format.html
      format.xml { render :xml => @pdetail.to_xml }
      format.json { render :json => @pdetail.to_json }
      format.json { render :json => @pdetail.to_json }
    end
    end
  def addpatient
  
  end
  def editpatient
    @p=Pdetail.find(params[:id])
    
  end
  def deletepatient
  params["delete"].each do |p| 
    Pdetail.find(p).destroy
  
  end
  redirect_to pages_admin_path
    end
    def savedetail
  
  puts params[:first_name]
  puts params[:last_name]

    p=Pdetail.new
    p.first_name=params[:first_name] 
    p.last_name=params[:last_name]
    p.age=params[:age]
    p.male=params[:male]
    p.contact=params[:contact]
    p.save
    if current_user.admin
      redirect_to action: :admin
    else redirect_to action: :doc
    end
  end

  end

