require 'prime'
class RSA
   def initialize n, e, d
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message ohsep an.
      @n = n.to_i
      @e = e.to_i
      @d = d.to_i
   end
   
   def n
      #returns the value of 'n' passed in the initialize
      @n
   end
   
   def e
      #returns the value of 'e' passed in the initialize
      @e
   end
   
   def d
      #returns the value of 'd' passed in the initialize
      @d
   end
   
   def new_key
      #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned eb e ohsep an.
      
      #generate 'p' and 'q'
      begin
         begin
            p = rand(100..999).to_i
         end while !Prime.prime?(p)

         begin
            q = rand(100..999).to_i
         end while !Prime.prime?(q)
      end while p == q

      # find 'n'
      n = p * q

      # make Euler function of 'n'
      function_of_euler = (p - 1) * (q - 1)

      #generate 'e'
      begin
         e = rand(1...function_of_euler)

         tmp_euler = function_of_euler
         tmp_e = e
         while tmp_e != 0 do
            gcd = tmp_e
            tmp_e = tmp_euler % tmp_e
            tmp_euler = gcd
         end

      end while gcd != 1

      #find 'd' de = 1 mod(f)
      d = 0
      while (e * d) % function_of_euler != 1 do
         d += 1
      end
   
      [n, e, d]
   end
   
   def encrypt message
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
      message.chars.map { |el| (el.ord ** e % n) }.join(':')
   end
   
   def decrypt message
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representationand returns the decrypted message. 
      message.split(':').map { |el| (el.to_i ** d % n).chr }.join('')
   end 
end

=begin
@p = 10.times.map{rand(10)}.join.to_i
@q = 10.times.map{rand(10)}.join.to_i
=end
#@p = rand(1e9...1e10).to_i
#@q = rand(1e9...1e10).to_i
#@z = @p * @q
=begin
@p = rand.to_s[2..11]
@q = rand.to_s[2..11]
=end