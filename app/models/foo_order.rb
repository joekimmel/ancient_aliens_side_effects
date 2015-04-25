class FooOrder < ActiveRecord::Base

  belongs_to :fooperty
  belongs_to :foonit

  validate :fooperty_and_foonit_match

  def fooperty_and_foonit_match
    return unless fooperty.present? && foonit.present?
    unless self.fooperty.foonits.include? self.foonit
      errors.add(:base, "Fooperty and Foonit don't match. No Recess")
    end
  end

end
