class MessageSerializer < ActiveModel::Serializer
  attributes :author, :body, :id

  delegate :body, :id, to: :object

  def author
    object.user.username
  end
end
