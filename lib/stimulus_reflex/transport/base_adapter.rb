module StimulusReflex
  module Transport
    class BaseAdapter
      attr_reader :document, :safe_selectors

      def transmit_morphs(selectors, data, html)
        @document = Nokogiri::HTML(html)
        @safe_selectors = selectors.select { |s| @document.css(s).present? }
      end

      def transmit_errors(message, data = {})
        Rails.logger.error "\e[31m#{message}\e[0m"
      end

      def env
        {}
      end
    end
  end
end