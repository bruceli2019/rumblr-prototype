class MessagesController < ApplicationController
  def index
    @messages = Message.all

    render("message_templates/index.html.erb")
  end

  def show
    @message = Message.find(params.fetch("id_to_display"))

    render("message_templates/show.html.erb")
  end

  def new_form
    @message = Message.new

    render("message_templates/new_form.html.erb")
  end

  def create_row
    @message = Message.new

    @message.match_id = params.fetch("match_id")
    @message.chat = params.fetch("chat")

    if @message.valid?
      @message.save

      redirect_back(:fallback_location => "/messages", :notice => "Message created successfully.")
    else
      render("message_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @message = Message.find(params.fetch("prefill_with_id"))

    render("message_templates/edit_form.html.erb")
  end

  def update_row
    @message = Message.find(params.fetch("id_to_modify"))

    @message.match_id = params.fetch("match_id")
    @message.chat = params.fetch("chat")

    if @message.valid?
      @message.save

      redirect_to("/messages/#{@message.id}", :notice => "Message updated successfully.")
    else
      render("message_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @message = Message.find(params.fetch("id_to_remove"))

    @message.destroy

    redirect_to("/messages", :notice => "Message deleted successfully.")
  end
end
