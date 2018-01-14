#require 'rspec'
#require '../lib/RSA.rb'

RSpec.describe RSA do
	context "check returned values of initialized variables with static key" do
		r = RSA.new(779113, 246317, 412553)
		it "should return 'n' -> 779113" do
			expect(r.n).to eq 779113
		end

		it "should return 'e' -> 246317" do
			expect(r.e).to eq 246317
		end

		it "should return 'd' -> 412553" do
			expect(r.d).to eq 412553
		end
	end

	context "check encrypting and decrypting with static key" do
		r = RSA.new(779113, 246317, 412553)
		msg = "zdr kp"
		it "should encrypt/decrypt #{msg}" do
			expect(r.decrypt(r.encrypt(msg))).to eq msg
		end
	end

	context "check encrypting and decrypting with dinamic key" do
		r = RSA.new(*RSA.new(0, 0, 0).new_key)
		msg = "pe6oprogr@mista.!?  :D"
		it "should encrypt/decrypt #{msg}" do
			expect(r.decrypt(r.encrypt(msg))).to eq msg
		end
	end

	context "second test for check encrypting and decrypting with dinamic key" do
		r = RSA.new(*RSA.new(0, 0, 0).new_key)
		msg = "Plus SometHing morE for yOu"
		it "should encrypt/decrypt #{msg}" do
			expect(r.decrypt(r.encrypt(msg))).to eq msg
		end
	end
end