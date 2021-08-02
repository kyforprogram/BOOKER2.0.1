class SearchController < ApplicationController
  def search
    @keyword = params["search"]["keyword"]
    @model = params["search"]["model"]
    @way = params["search"]["way"]
    @alldata = search_for(@model, @keyword, @way)
  end

private

  def parfect_match(model, keyword)
    if model == 'user'
      User.where(name: keyword)
    elsif model == 'book'
      Book.where(title: keyword)
    end
  end

  def forward(model, keyword)
    if model == 'User'
      User.where("name LIKE ?", "#{keyword}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "#{keyword}%")
    end
  end

  def backward(model, keyword)
    if model == 'user'
      User.where("name LIKE ?", "%#{keyword}")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{keyword}")
    end
  end

  def partical(model, keyword)
    if model == 'user'
      User.where("name LIKE ?", "%#{keyword}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{keyword}%")
    end
  end

  def search_for(model, keyword, way)
    case way
      when 'parfect_match'
        parfect_match(model, keyword)
      when 'forward'
      forward(model, keyword)
      when 'backward'
        backward(model, keyword)
      when 'partical'
        partical(model, keyword)
    end
  end

end
