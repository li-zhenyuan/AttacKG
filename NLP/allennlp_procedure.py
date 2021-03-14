from typing import Iterable
from allennlp.data import DatasetReader, Instance


class CTIReportReader(DatasetReader):
    def _read(self, file_path: str) -> Iterable[Instance]:
        with open(file_path, 'r') as lines:
            pass

