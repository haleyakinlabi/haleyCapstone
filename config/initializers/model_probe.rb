# frozen_string_literal: true

ActiveRecord::Base.extend ModelProbe if Rails.env.development?
