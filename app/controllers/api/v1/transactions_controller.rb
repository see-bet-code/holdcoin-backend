class Api::V1::TransactionsController < ApplicationController
  def show
    transaction = Transaction.find(params[:id])
    render json: TransactionSerializer.new(transaction)
  end

  def index
    transactions = Transaction.all
    render json: transactions
  end

  def create
    crypto = Crypto.create(crypto_params.merge(hold_params))
    if crypto.valid?
      transaction = Transaction.create(transaction_params.merge({crypto_id: crypto.id}))
      unless transaction.errors.any?
        render json: { transaction: TransactionSerializer.new(transaction), crypto: CryptoSerializer.new(crypto) }, status: :created
      else
        transaction.destroy
        render json: { errors: transaction.errors.full_messages}, status: :not_acceptable
      end
    else
      crypto.destroy
      render json: { errors: crypto.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def transaction_params
    params.permit(
      :size,
      :side,
      :user_id
    )
  end

  def crypto_params
    params.require(:crypto).permit(
        :name,
        :price,
        :symbol,
        :max_supply
      )
  end

  def hold_params
    params.permit(
      :hold_price,
      :stop_limit)
  end
  

end