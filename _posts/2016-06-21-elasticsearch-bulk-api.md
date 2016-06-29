---
layout: post
title: "elasticsearch bulk api"
date: Tue Jun 21 14:12:16 PDT 2016
---

Snippets for creating an elasticsearch index using its bulk api (and python
wrapper).

```python
def bulk_index(infile_csv, index_name):
    from elasticsearch.helpers import bulk

    _create_index(index_name)

    print 'Bulk indexing %s...' % infile_csv,
    sys.stdout.flush()
    bulk(client=_es, actions=_actions(infile_csv, index_name))
    print 'Done'
    pprint(_es.count(index=index_name))


def _create_index(name):
    global _es

    body = {
        'mappings': {
            'teaser': {
                'properties': {
                    'foo': { 'type': 'integer' },
                    'bar': { 'type': 'float' },
                    # defaults to string if not specified
                    'baz': { 'type': 'string' },
                }
            }
        }
    }

    if not _es.indices.exists(name):
        print "Creating index: %s" % name
        _es.indices.create(name, body=body)
    else:
        print "Index: %s already exists" % name


def _actions(infile_csv, index_name):
    """
    Return generator of actions for elasticsearch bulk indexing
    """
    with open(infile_csv) as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            row.update(
                _index=index_name,
                _type='teaser',
                _op_type='index',
                )
            mapping = {
                'foo': int,
                'bar': float,
            }
            yield {k: mapping[k](v) if k in mapping else v for k,v in row.items()}

```
