class Store::SearchesController < ApplicationController

  def search
    @content = params['search']['content']
    @how = params['search']['how']
    @model = params['search']['model']
    @datas = search_for(@how, @model, @content)
  end

  private

  def match(model, content)
    if model == 'store'
      Store.where(name: content)
    elsif model == 'individual'
      Individual.where(name: content)
    end
  end

  def forward(model, content)
    if model == 'store'
      Store.where('name LIKE ?', "#{content}%")
    elsif model == 'individual'
      Individual.where('name LIKE ?', "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'store'
      Store.where('name LIKE ?', "%#{content}")
    elsif model == 'individual'
      Individual.where('name LIKE ?', "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'store'
      Store.where('name LIKE ?', "%#{content}")
    elsif model == 'individual'
      Individual.where('name LIKE ?', "%#{content}")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end

end
