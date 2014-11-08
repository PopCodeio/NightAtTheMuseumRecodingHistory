module ApplicationHelper
  def tr(translation)
    text = I18n.t translation
    text.gsub('_',' ').gsub('translation missing: en.','')
  end
end
