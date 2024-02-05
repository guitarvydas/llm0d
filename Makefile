LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

run: llm0d transpile.drawio.json
	./llm0d main llm0d.drawio $(LIBSRC)/transpile.drawio

llm0d: llm0d.drawio.json
	odin build . $(ODIN_FLAGS)

llm0d.drawio.json: llm0d.drawio transpile.drawio.json
	$(D2J) llm0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf llm0d llm0d.dSYM *~ *.json
	(cd agency ; make clean)


agency/main:
	(cd agency ; make)
