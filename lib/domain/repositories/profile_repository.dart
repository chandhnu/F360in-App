import '../models/profile.dart';

abstract class ProfileRepository {
  Future<Profile> createProfile(Profile profile);
  Future<Profile?> getProfile(String profileId);
  Future<List<Profile>> getProfilesForUser(String userId);
  Future<void> updateProfile(Profile profile);
  Future<void> deleteProfile(String profileId);
}
