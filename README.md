# rockway
This is the website for Rockway Wellness Clinic and Rockway Massage Therapy.

Here's a list of files that are important:
- index.html - The master website file that's loaded by the browser.
		This file contains the core structure of the site and the top header and main menu
- massage.html - This is the Massage Therapy website page. No other pages are used for this site.

- /sections - This is the folder containing the page sections for the site.
		Each section has a mini-page to make it harder to damage the entire site by breaking a small file.
		The names of the sections match the menus (in most cases), so:
-- blog-list.html - (UNUSED) The blog section
-- booking.html - (UNUSED) The section showing booking information
-- clients.html - (UNUSED) The section describing clients
-- contact.html - (UNUSED) The contact us section (index.html contains the actual Contact US section, this is for more complex information)
-- COVID.html - (UNUSED) The section describing COVID precautions
-- plans.html - (UNUSED) The section describing billing plans
-- portfolio.html - (UNUSED) The section describing the portfolio of services available
-- services.html - The section describing the services available at Rockway
-- stats.html - (UNUSED) The section intended to show statistics of customer satisfaction
-- team.html - The section showing the team members and their Biographies

- /css/style.css - The master style sheet
- /original - The original images before editing for site use
- /assets - The files used
-- /plugins - The Javascript used
-- /images/members - The folder holding the "headshots" of the team
-- /images/services - The folder holding the services pictures available/in use
-- /images/slider - The folder holding the top slide gallery images
-- /js - The custom Javascript unique to the site
- /logo - The folder containing the raw Rockway Logo images and the original site theme (non-customized)

Miscellaneous pages:
- single.html - The site if managed as a single page (easy to break), most useful to clone another mini-site for one of the team that doesn't have a website of their own.

Editing index.html/single.html/massage.html
- The sections to be loaded are set by the "Dynamic sections" definition near the top of the index.html file.
-- This is a list of sections to display (including menu items at the top), so to add/remove a menu item and the section that goes with it is as simple as adding or removing from the list of sections on the 'var sections = ' line.
-- There is a comment above this line showing the spelling of all of the options. So to add a section copy from the example and insert it into the comma separated list (including the square brackets and quotes as shown)
-- Adding a completely new section requires:
--- Adding a new "LI" line in the "TopHead" div block near the top of index.html
--- Adding the new block into the /css/style.css with the same spelling as the section name (e.g. "#COVID" for "COVID")
--- Adding the new block into index.html in the sections block in the middle of index.html
--- Adding a new file into /sections/ folder with the same name/spelling as the section name
--- The section name must be one word without spaces!

Editing a Section:
- Open the appropriate section file within the /sections folder
- Add the content required
- NOTE: Browsers will keep an old copy of this file and in many cases refuse to show the new content.
	If you open the section file directly (e.g. http://rockwaywellnessclinic.ca/sections/team.html or http://rockwaymt.github.io/sections/team.html)
	the browser will load the latest file.
- There are a number of fonts available, the easiest solution is to find a section with a font you like and then find and copy the HTML from around it.

Editing an Image:
- Many of the images require specific sizes to work properly:
-- Slide show images should be at least 1500 pixels wide and 500-600 pixels high or they will look funny
-- Team member headshots should be as close to square as possible at 200x200 pixels. Too big and they will be chopped off, too small and they look terrible
-- Services images should be rectangular and taller than they are wide: 500-600 pixels wide and 800-1000 pixels high. Too narrow and the balance of the text/image will look strange. Too tall without enough text will also look strange vertically.
