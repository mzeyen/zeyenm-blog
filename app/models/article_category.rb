class ArticleCategory < ActiveRecord::Base

    # This belongs to article and category
    belongs_to :article
    belongs_to :category
end