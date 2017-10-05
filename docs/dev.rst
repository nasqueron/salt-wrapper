=============================
salt-wrapper developer manual
=============================

This manual covers all you need to develop for a Nasqueron software,
with the relevant aspects specific to salt-wrapper.

.. note::

  Nasqueron development servers have already those software installed.
  Ask an access if you wish to get directly a working environment.

*********************
Contribution workflow
*********************

You'll find at https://agora.nasqueron.org/How_to_contribute_code a comprehensive guide.

In a nutshell:
  - from the master branch, create a new Git branch for the fix
  - craft one commit (if you need to edit it, use ``git commit --amend``)
  - send this commit to our code review system with ``arc diff``

If you don't have Arcanist installed, you can instead open a pull request on GitHub,
if you submit a small fix like fix a typo. 

If you've several changes to submit, prepare distinct branches, one per change.

**********************
Arcanist configuration
**********************

Shellcheck
===========

Arcanist is configured to lint the shell code with shellcheck.

Shellcheck installation
-----------------------

You first need to install shellcheck through your package manager,
of if it's not available for your OS/distro  with ``cabal install shellcheck``.

On FreeBSD, the package name is in CamelCase: ``pkg install hs-ShellCheck``.

Shellcheck Arcanist linter installation
---------------------------------------

Clone the linter repository in the same folder where you've Arcanist
and libphutil.

For example, if you've Arcanist installed as ``/opt/phabricator/arcanist``,
you can install the linter as ``/opt/phabricator/shellcheck-linter``.

.. code-block:: shell

  $ cd /opt/phabricator
  $ git clone https://devcentral.nasqueron.org/source/shellcheck-linter.git

Python linters
==============

You need ``pep8`` and ``flake8`` commands, for Python 3.

.. warning::

  Most Nasqueron software use Python 3, and not Python 2.
  As such, linter tools must also be for Python 3.

Install directly the software
-----------------------------

.. code-block:: shell

  $ pip3 install flake8 pep8

Use a virtualenv instead
------------------------

If you need to develop for Python 2 and Python 3, the easiest road
is through a Python virtual environment.

To create one:

.. code-block:: shell

  $ python3 -m venv ~/dev/python/general3
  $ source ~/dev/python/general3/activate # use activate.csh for tcsh
  $ pip install flake8 pep8
