require "rails_helper"

RSpec.describe ::SectionsResponder do
    subject(:responder) {described_class.new}

    context 'produce message for topic' do

    it { expect(described_class.topcis.size).to eq 1 }

        describe 'topic(s) to speak to' do
            let(:topic) { described_class.topics['section_chage'] }
            it { expect(topic.name).to eq 'section_change' }
         end

        describe '#call' do
            let(:input_data) { { rand => rand } }
            let(:accumulated_data) do
                [[event.to_json, { topic: 'section_change'}]]
            end

            it 'expect to add builds to message buffer' do
                responder.call(event)
                expect(responder.message_buffer['section_change']).to eq accumulated_data
            end
        end
    end
end
