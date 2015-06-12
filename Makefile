CERT=stunnel.pem

run: $(CERT)
	stunnel4 stunnel.config

$(CERT): $(CERT)
	./make_cert.sh localhost

.PHONY: clean

clean:
	rm -f stunnel.key stunnel.pem stunnel.req ca.*
	
