class BookStateCreate
  include Interactor

  before do
    #
  end

  def call    
    # Check if a state already exists for the same book_id with returned_at in nil
    existing_state = State.find_by(book_id: context.state_params[:book_id], returned_at: nil)

    if existing_state
      context.fail!(error: "The book is already borrowed, select another book or came back in 4 days.")
    else
      state = State.create(context.state_params)
      context.fail! unless state.valid?
      context.state = state
      
      user = User.find_by(id: context.state_params[:user_id])
      UserMailer.return_receipt_email(user)
    end
  end

  after do
    #
  end

end
