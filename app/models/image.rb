class Image < ApplicationRecord
  is_impressionable

  belongs_to :gallery

  has_attached_file :file,
                    styles: {
                      medium: '1000x1000',
                    }

  validates_attachment :file,
                       presence: true,
                       content_type: {
                         content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                         message: 'file type is not allowed (only jpg/png/gif images)'
                       },
                       size: { in: 0..250.kilobytes }
end
