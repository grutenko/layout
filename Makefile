HTML_TARGETS := public/index.html \
					 public/about-us.html \
					 public/completed-project.html \
					 public/completed-projects.html \
					 public/contacts.html \
					 public/service.html \
					 public/services.html

HTML_DEPS := _base.pug \
						 _internal-base.pug \
						 _contact-block0.pug \
						 _contact-block1.pug \
						 _contact-block2.pug

CSS_TARGETS := public/style.css \
							 public/contact-block0.css \
							 public/contact-block1.css \
							 public/contact-block2.css

JS_TARGETS := public/contact-block0.js \
							public/script.js
							 

TARGETS := $(HTML_TARGETS) $(CSS_TARGETS) $(JS_TARGETS)


all: $(TARGETS)

public/%.html:%.pug $(HTML_DEPS)
	pug --pretty --path=. < $< > $@

public/%.css:%.css
	npx postcss $^ --use autoprefixer -d public/

public/%.js:%.js
	cp $^ $@

.PHONY: clean validate watch watch-pug watch-autoprefier

clean:
	rm -f $(TARGETS)

validate:
	cd public && w3c-validator check $(HTML_TARGETS)

watch:
	$(MAKE) watch-pug &
	$(MAKE) watch-autoprefixer

watch-pug:
	pug --pretty --watch --out public $(notdir $(HTML_TARGETS:.html=.pug))

watch-autoprefixer:
	npx postcss --watch $(notdir $(CSS_TARGETS)) --use autoprefixer -d public/