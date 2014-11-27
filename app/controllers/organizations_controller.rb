class OrganizationsController < ApplicationController
	
	before_action :set_organization, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!


	def index
	  @organizations = Organization.all
	end

	def show
	end

	def new
	  @organization = Organization.new
	end

	def create
	  @organization = Organization.create(org_params)

	  respond_to do |f|
		if @organization.save
		  f.html {redirect_to @organization, notice: 'Organization was successfully created'}
		else
		  f.html {render action: 'new'}
	    end
	  end
	end

	def edit
	end

	def update
	  @organization = Organization.update(org_params)

	  respond_to do |format|
	  	if @organization.save
	  	  format.html {redirect_to @organization, notice: 'Organization information successfully updated.'}
	  	else
	  	  format.html {render action: 'edit'}
	  	end
	  end
	end

	def destroy
	  @organization.destroy

	  respond_to do |format|
	  	format.html {redirect_to organizations_path}
	  end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
	def set_organization
	  @organization = Organization.find(params[:id])
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def org_params
      params.require(:organization).permit(:name, :variety)
    end

end

