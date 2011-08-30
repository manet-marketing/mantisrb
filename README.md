MantisRb
========

mantisrb is an API that works with the [Savon][1] gem to talk to a [Mantis][2]
bug tracker.  [Mantis][2] provides an API to integrate with it through an older
SOAP 1.1 interface (sorry) called [MantisConnect][3](see [example][4] for an interactive API browser).  Using this API should make working with an
external Mantis bug tracker easy(ier).

How to use
----------

Using mantisrb is pretty straightforward.  First, install the gem:

    gem install mantisrb

Then, when you want to create a session;

    require 'mantisrb'

    session = Mantis:Session.new "http://mantisurl.com/mantis", "Username", "Password"

From here on out, you can get access to various Mantis components:

Projects
--------

Get a list of projects that your user can access:

    session.projects.list

Create a project:

    project = session.projects.create {
      name: "project thing",
      status: session.projects.status.development,
      enabled: true,
      view_state: :public # or 'public', or session.projects.status.public,
      inherit_from_global: true
    }

    project.name  # "project thing"
    project.id    # 10 or whatever for referencing
    project......

Issues
------

Getting issues is easy, too:

by id:

    session.issues.by_id 110 # if you know the id
    session.issues.exists? 110 # if you don't know if it's there
    session.issues.by_name "problem name I solved" # name of Mantis issue that
    you want to search explicitly by (no wildcards or regex'ing, sorry)

    session.projects.issues "project name" # get first 100 issues by Project Name

by ugly Mantis summary searching:

    session.issues.summary_matches "some regex"  # Do some ssearching (mind, it
    is going to be pretty slow)

by project id:

    session.issues.by_project_id project_id, page_#, issues_per_page # The
    fully flexible way of getting a list of issues
    session.issues.by_project_id project_id # gets you an Enumerable to go
    through things
    session.issues.by_project_id project_id, limit # number of issues to get at
    once

Filters (Mantis equivalent of a saved search)
---------------------------------------------

    session.filters.by_project_id 110 # get all filters you can search by for
    the project_id

    session.filters.get_issues project_id # get first 100 issues for a given
    filter
    session.filters.get_issues project_id, page_num, issues_per_page
    # fully-formatted search




 [1]: http://www.savonrb.com
 [2]: http://www.mantisbt.org
 [3]: http://www.futureware.biz/mantisconnect/concept.php
 [4]: http://www.mantisbt.org/demo/api/soap/mantisconnect.php
