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
      transaction = Transaction.new(transaction_params)
      unless transaction.save
          render json: { status: 500 }
      else
          render json: {
              status: :added,
              transaction: TransactionSerializer.new(transaction)
          }
      end
  end

  private

  def transaction_params
      params.permit(
          :size,
          :side,
          :crypto_id,
          :user_id
      )
  end
end