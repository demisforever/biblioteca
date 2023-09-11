class BookStateCreate
  include Interactor

  before do
    #context.fail!(error: Constants::EMAIL_ERROR) unless context[:email] =~ EMAIL_REGEX
    #context.fail!(error: Constants::BORROWED_BOOK) if context[:age] < 18 # si el libro ya esta prestado
  end

  def call
    state = State.create(context.state_params)     
    context.fail! unless state.valid? 
    context.state = state
  end

  after do
    # Mailer.send_welcome_email(context.user.email)
  end

end
