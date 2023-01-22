class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

def new
  @proposal = Proposal.new
  flash.now[:danger] = "Supostamente deu."
end

def create
  @proposal = Proposal.new(proposal_params)
  if @proposal.save
    flash.now[:danger] = "Supostamente deu."
    #redirect_to proposals_path
  else
    flash.now[:danger] = "An error occurred while trying to save the message."
    #render :new, status: :unprocessable_entity
  end
end

def proposal_params
  params.require(:proposal).permit(:title, :user_id)
end
end

