require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Kompetansesok::RapportMailer do
  before(:each) do
    @rapport_mailer = Kompetansesok::RapportMailer
  end

  it "send rapport when rapport is issued" do
    @rapport_mailer.should_receive(:send_email).and_return(true)
    @rapport_mailer.send_rapport("test rapport")
  end

end

