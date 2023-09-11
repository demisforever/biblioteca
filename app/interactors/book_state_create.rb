class BookStateCreate
  include Interactor

  before do
    #context.fail!(error: Constants::EMAIL_ERROR) unless context[:email] =~ EMAIL_REGEX
    #context.fail!(error: Constants::BORROWED_BOOK) if context[:age] < 18 # si el libro ya esta prestado
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
    end
  end

  after do
    # Mailer.send_welcome_email(context.user.email)
  end

end
