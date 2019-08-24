class ArticlesController < ApplicationController def show load_article end private def load_article @article ||= Article . find ( params [ :id ]) end end 
