class Course (object):

    def __init__(self, code, credit, title, description):
        self.code = code
        self.credit = credit
        self.title = title
        self.description = description

    @staticmethod
    def from_dict(source):
        # [START_EXCLUDE]
        course = Course(
            source[u'code'],
            source[u'credit'],
            source[u'title'],
            source[u'description']
        )

        return course
        # [END_EXCLUDE]

    def to_dict(self):
        # [START_EXCLUDE]
        todict = {
            'code': self.code,
            'title': self.title,
            'credit': self.credit,
            'description': self.description
        }
        return todict
    # [END_EXCLUDE]

    def __repr__(self):
        return (
            u'Course(code={}, title={}, credit={}, description={})'.format(self.code, self.title, self.credit, self.description[:20]))
