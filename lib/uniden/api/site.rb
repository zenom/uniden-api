module Uniden
  module Api

    class Site 
      include ActiveAttr::AttributeDefaults
      attribute :id
      attribute :reserved
      attribute :name
      attribute :quick_key
      attribute :site_hold_time 
      attribute :lockout
      attribute :modulation
      attribute :attenuation
      attribute :c_ch, default: '1'
      attribute :reserved_01
      attribute :reserved_02
      attribute :rev_index
      attribute :fwd_index
      attribute :system_index 
      attribute :channel_head
      attribute :channel_tail
      attribute :seq_no
      attribute :start_key 
      attribute :latitude
      attribute :longitude
      attribute :range
      attribute :gps_enabled
      attribute :reserved_03
      attribute :mot_type 
      attribute :edacs_type
      attribute :p25_waiting
      attribute :reserved_04

      def initialize(scanner, data)
        @scanner = scanner
        parse_data(data)
      end

      def parse_data(data)
        fields = self.attributes.keys
        data.each do |item|
          field = fields.shift
          self.send("#{field}=", item)
        end
      end
    end

  end
end