class API::V1::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    params[:page] ||= 1  
    @contacts = Contact.all
    filtering_params(params).each do |key, value|
      @contacts = @contacts.public_send(key, value) if value.present?
    end
     # Order by
     #order=name:asc / order=name:desc / order=name (defaults to ascending)
    @contacts = @contacts.order(params[:order].gsub(':', ' ')) if params[:order]

    # if params[:relationship]
    #   render json: Contact.relationship(params[:relationship])
    # else
    #   render json: Contact.all
    # end

    # if (params[:offset] && params[:limit])
    #   @contacts = @contacts.page(1).per(params[:limit]).padding(params[:offset])
    # else
    #   @contacts = @contacts.page(1).per(25)
    # end

    # @contacts = @contacts.relationship(params[:relationship]) if params[:relationship]

    render json: @contacts


  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    render json: @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      head :no_content
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :twitter, :birthday, :phone, :relationship)
    end

    def filtering_params(params)
      params.slice(:search_name, :search_relationship, :search_twitter, :fuzzy_twitter, :page, :per, :fuzzy_name)
    end
end

