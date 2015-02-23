module Uniden
  module Api
  
    class System < Scanner
      include ActiveAttr::AttributeDefaults
      
      attribute :id
      attribute :type 
      attribute :name 
      attribute :quick_key 
      attribute :hold 
      attribute :lockout 
      attribute :delay
      attribute :reserve_01, default: ''
      attribute :reserve_02, default: ''
      attribute :reserve_03, default: ''
      attribute :reserve_04, default: ''
      attribute :reserve_05, default: ''
      attribute :rev_index
      attribute :fwd_index 
      attribute :channel_group_head 
      attribute :channel_group_tail 
      attribute :seq_no 
      attribute :start_key 
      attribute :reserve_06, default: ''
      attribute :reserve_07, default: ''
      attribute :reserve_08, default: ''
      attribute :reserve_09, default: ''
      attribute :reserve_10, default: ''
      attribute :number_tag 
      attribute :agc_analog
      attribute :agc_digital 
      attribute :p25_waiting 
      attribute :protected 
      attribute :reserve_11

      def initialize(scanner, data)
        @scanner = scanner
        parse_data(data)
      end

      def conventional?
        type == 'CNV'
      end

      def parse_data(data)
        fields = self.attributes.keys
        data.each do |item|
          field = fields.shift
          self.send("#{field}=", item)
        end
      end

      def sites
        sites = []
        site_index = channel_group_head
        while site_index.to_i != -1 do 
          data  = @scanner.send_read("SIF, #{site_index}")
          data.unshift(site_index)
          site = Site.new(@scanner, data)
          sites << site
          site_index = site.fwd_index
        end
        sites
      end

    end
  
  end
end