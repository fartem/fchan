abstract class StorageEntity {
  int? id;

  StorageEntity(this.id);

  bool isNew() => id == null;
}
