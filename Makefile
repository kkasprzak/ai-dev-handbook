new-retro:
	@retro_file=daily_retrospective/`date +%Y-%m-%d`.md; \
	if [ ! -f $$retro_file ]; then \
	  echo '# AI Daily Retrospective - '`date +%Y-%m-%d` > $$retro_file; \
	  echo '' >> $$retro_file; \
	  echo '## **What new things did I test/apply today in the context of AI/systems?**' >> $$retro_file; \
	  echo '' >> $$retro_file; \
	  echo '## **What specifically worked, and what was difficult?**' >> $$retro_file; \
	  echo '' >> $$retro_file; \
	  echo '## **What observation/conclusion do I take from today?**' >> $$retro_file; \
	  echo '' >> $$retro_file; \
	  echo '## **How can I use this learning tomorrow/in the future?**' >> $$retro_file; \
	  echo '' >> $$retro_file; \
	  echo 'Created new retrospective: '$$retro_file; \
	else \
	  echo 'Retrospective for today already exists: '$$retro_file; \
	fi
