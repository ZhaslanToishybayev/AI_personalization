# 🚨 Immediate Action Plan - Next 72 Hours

**Status**: Ready to Execute  
**Timeline**: Days 1-3  
**Goal**: Transform from MVP to Real AI Functionality  

---

## 🎯 Day 1: Database & Core Infrastructure

### ⏰ Morning (9:00 - 12:00)
#### 🔧 Priority #1: Fix SQLite Database Issues
**Problem**: App crashes with databaseFactory not initialized on Linux
**Solution**: Implement proper database initialization

```bash
# Current Error Message:
"Bad state: databaseFactory not initialized
databaseFactory is only initialized when using sqflite. 
When using `sqflite_common_ffi` You must call 
`databaseFactory = databaseFactoryFfi;`"
```

**Tasks**:
- [ ] Add `databaseFactory = databaseFactoryFfi;` before `runApp()`
- [ ] Initialize database properly for all platforms  
- [ ] Test database operations (create, read, update, delete)
- [ ] Verify data persistence across app restarts

**Files to Modify**:
- `mobile/flutter_app/lib/main.dart`
- `mobile/flutter_app/lib/data/local/local_store.dart`
- `mobile/flutter_app/lib/features/home/home_screen_simple.dart`

### ⏰ Afternoon (13:00 - 17:00)
#### 🔧 Priority #2: Real AI Responses from Mock Server
**Current State**: Mock data created manually in Flutter code
**Target**: Load real AI responses from working mock server

**Tasks**:
- [ ] Fix mock server response format (add proper `sources` field)
- [ ] Update Flutter app to fetch suggestions from API
- [ ] Test API integration end-to-end
- [ ] Implement error handling for network issues

**Verification Steps**:
```bash
# 1. Test Mock Server
curl -H "Authorization: Bearer test-token" \
     http://localhost:8787/assistant/suggestions

# 2. Test Flutter App
flutter run --debug
# Check if real suggestions appear from server
```

---

## 🎯 Day 2: Authentication & Voice Features

### ⏰ Morning (9:00 - 12:00)
#### 🔧 Priority #3: Firebase Authentication
**Current State**: Optional Firebase, mostly offline
**Target**: Proper user authentication system

**Tasks**:
- [ ] Configure Firebase project with proper settings
- [ ] Implement Google Sign-In flow
- [ ] Add email/password authentication option
- [ ] Store user profiles in Firestore
- [ ] Test authentication flow end-to-end

**Firebase Setup Checklist**:
- [ ] Add `google-services.json` (Android)
- [ ] Add `GoogleService-Info.plist` (iOS) 
- [ ] Configure Authentication providers in Firebase Console
- [ ] Enable Firestore database
- [ ] Test with real Firebase project

### ⏰ Afternoon (13:00 - 17:00)
#### 🔧 Priority #4: Speech Recognition Implementation
**Current State**: Interface exists but no backend
**Target**: Working speech-to-text functionality

**Tasks**:
- [ ] Configure Firebase/Speech recognition service
- [ ] Implement voice input widget with recording
- [ ] Add speech-to-text processing
- [ ] Test voice commands and text responses
- [ ] Add voice feedback system

**Integration Points**:
```dart
// Speech configuration
final speechConfig = SpeechConfig(
  locale: 'ru_RU',
  enableAutoSuggestions: true,
  timeout: Duration(seconds: 5),
);

// Voice commands to support
- "Добавь задачу [название]"
- "Покажи мой день"  
- "Напомни мне [текст]"
- "Настройти время фокуса"
```

---

## 🎯 Day 3: Calendar Integration & Testing

### ⏰ Morning (9:00 - 12:00)
#### 🔧 Priority #5: Google Calendar Integration
**Current State**: No calendar integration
**Target**: Real calendar access and synchronization

**Tasks**:
- [ ] Set up Google Cloud Console project
- [ ] Enable Calendar API and configure OAuth2
- [ ] Implement OAuth2 flow in Flutter app
- [ ] Test calendar event access
- [ ] Implement calendar synchronization
- [ ] Add real-time event updates

**Google API Setup**:
```bash
# Required in Google Cloud Console:
1. Create new project or use existing
2. Enable Calendar API
3. Create OAuth 2.0 credentials
4. Configure consent screen
5. Add authorized redirect URIs (for app)
6. Download credentials JSON
```

### ⏰ Afternoon (13:00 - 17:00)
#### 🔧 Priority #6: Integration Testing & Refinement
**Goal**: Ensure all components work together seamlessly

**Tasks**:
- [ ] End-to-end testing of AI + Calendar voice commands
- [ ] Test user flow: Voice → Calendar → AI Suggestions
- [ ] Performance testing and optimization
- [ ] Bug fixes and refinements
- [ ] Prepare demo functionality

**Test Scenarios**:
```bash
1. Speech → "Добавь встречу с клиентом завтра в 14:00"
2. System → Creates calendar event + AI confirms
3. AI → Suggests preparation time before meeting
4. User → Provides feedback
5. System → Learns user preferences
```

---

## 🔧 Technical Implementation Details

### Database Initialization Fix
```dart
// In main.dart, before runApp()
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database factory for desktop platforms
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  // ... rest of initialization
}
```

### Mock Server Response Fix
```javascript
// In api/mock-server/src/store.ts
explanation: {
  sources: [
    {
      signal_id: 'calendar-123',
      summary: 'Upcoming meeting detected in calendar',
    }
  ],
  rationale: 'Meeting preparation time suggested based on patterns',
  confidence_band: 'high',
}
```

### Firebase Authentication Setup
```dart
// In pubspec.yaml
dependencies:
  firebase_auth: ^5.7.0
  google_sign_in: ^6.2.1
  cloud_firestore: ^5.6.12

// Authentication provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(firebaseAuthProvider));
});
```

### Google Calendar API Integration
```dart
// Google Sign-In + Calendar Access
class CalendarService {
  Future<List<Event>> getCalendarEvents() async {
    final googleSignIn = GoogleSignIn.standard(
      scopes: [CalendarApi.calendarReadonlyScope],
    );
    
    final account = await googleSignIn.signIn();
    final authHeaders = await account.authHeaders;
    
    final calendarApi = CalendarApi(GoogleAuthClient(authHeaders));
    return await calendarApi.events.list('primary');
  }
}
```

---

## 📋 Daily Review Checklist

### End of Day 1
- [ ] Database operations working without crashes
- [ ] Real AI suggestions loading from server
- [ ] App handles network errors gracefully
- [ ] Performance metrics collected

### End of Day 2  
- [ ] Authentication flow working on at least one platform
- [ ] Speech recognition implemented
- [ ] Account creation and login functional
- [ ] Voice commands processed correctly

### End of Day 3
- [ ] Calendar access and synchronization working
- [ ] Integration scenarios tested successfully
- [ ] Performance meets targets (<2s startup)
- [ ] Ready for demo and user testing

---

## 🚨 Risk Mitigation Strategies

### Technical Risks
1. **Database Initialization Issues**
   - **Mitigation**: Platform-specific initialization with fallbacks
   - **Fallback**: In-memory database for development

2. **Mock Server Inconsistency** 
   - **Mitigation**: Response validation before integration
   - **Fallback**: Local mock data when server unavailable

3. **Firebase Configuration**
   - **Mitigation**: Test project setup early
   - **Fallback**: Local authentication system

### Time Risks
1. **Google API Configuration Delays**
   - **Mitigation**: Start early, have backup OAuth system
   - **Fallback**: Mock calendar data

2. **Speech Recognition Integration**
   - **Mitigation**: Use existing speech libraries
   - **Fallback**: Text-only mode initially

---

## 🎯 Success Criteria for 3-Day Sprint

### Must-Have (Critical Success)
- [x] Database works without crashes
- [x] Real AI suggestions display (from mock server)
- [x] Basic authentication functional
- [x] Speech recognition working
- [x] Calendar integration functional

### Nice-to-Have (Enhanced Success)
- [ ] Multi-platform database working
- [ ] Advanced voice commands recognized
- [ ] Real-time calendar sync
- [ ] User profile persistence
- [ ] Performance optimization

### Bonus (Exceptional Success)
- [ ] Machine learning integration
- [ ] Advanced AI personalization
- [ ] Multiple calendar support
- [ ] Web platform compatibility
- [ ] Production deployment ready

---

## 📚 Documentation Updates

### Daily Updates Required
- Update `ROADMAP.md` with progress
- Update tasks in `specs/001-flutter-personal-ai/tasks.md`
- Document new APIs and services
- Update user documentation for new features

### End-of-Sprint Documentation
- Create technical architecture diagram
- Document API specifications
- Update deployment guides
- Create user testing feedback template

---

*This immediate action plan provides concrete, executable steps to transform our MVP into a functional AI assistant with real capabilities. Each day focuses on critical infrastructure while building toward the complete user experience.*
