module RacesHelper
  def convert(date)
    date.chars.delete_at(9).delete_at(9).join
  end
end
