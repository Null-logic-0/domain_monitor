class DomainsController < ApplicationController
  def index
    @domains = Current.user.domains.order("#{sort_column} #{sort_direction}")
  end

  def create
    @domain = Current.user.domains.build(domain_params)
    if @domain.save
      flash[:notice] = "Domain has been added successfully!"
    else
      flash[:alert] = @domain.errors.full_messages.first
    end
    redirect_to domains_path
  end

  def destroy
    Current.user.domains.find(params[:id]).destroy
    flash[:notice] = "Domain has been removed successfully!"
    redirect_to domains_path
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end

  helper_method :sort_column, :sort_direction

  def sort_column
    allowed = %W[name,expires_at last_checked_at]
    params[:sort].presence_in(allowed) || "expires_at"
  end

  def sort_direction
    params[:direction].presence_in(%w[asc desc]) || "asc"
  end
end
