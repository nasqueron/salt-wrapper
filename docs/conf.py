# -*- coding: utf-8 -*-

#
#   -------------------------------------------------------------
#   Sphinx configuration for salt-wrapper
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        salt-wrapper
#   License:        Trivial work, not eligible to copyright
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   Table of contents
#   -------------------------------------------------------------
#
#   :: General onfiguration
#   :: HTML output
#   :: LaTeX output
#
#   -------------------------------------------------------------

#   -------------------------------------------------------------
#   General configuration
#   -------------------------------------------------------------

extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
project = u'salt-wrapper'
copyright = u'2017, Nasqueron'
author = u'Sébastien Santoro aka Dereckson'

version = u'0.1'
release = u'0.1'

language = None

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

pygments_style = 'sphinx'

todo_include_todos = False

#   -------------------------------------------------------------
#   HTML output
#   -------------------------------------------------------------

html_theme = 'alabaster'
html_static_path = ['_static']
htmlhelp_basename = 'salt-wrapperdoc'

#   -------------------------------------------------------------
#   LaTeX output
#   -------------------------------------------------------------

latex_elements = {
    'papersize': 'a4paper'
}

latex_documents = [
    (master_doc, 'salt-wrapper.tex', u'salt-wrapper Documentation',
     u'Sébastien Santoro aka Dereckson', 'manual'),
]
