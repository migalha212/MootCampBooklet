'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fc6b46931abf3598765f86901417abe6",
"assets/AssetManifest.bin.json": "80d2d2a2e0db25d458ce22a763e12c7a",
"assets/AssetManifest.json": "09cd1472b8a643cc538af3af26d62e5a",
"assets/assets/data/activities.json": "9f2c0018969576da470eedf6f936ec20",
"assets/assets/data/meals.json": "8cfab6dcb09004577e56476f01e902f2",
"assets/assets/data/paths.json": "a9997cc28121aa9fb21bfbb212c62fa4",
"assets/assets/data/path_115.json": "14a081a1d8f19024d4f050112a3ce0a6",
"assets/assets/data/path_116.json": "2909e4a0722e965c995bc21062adddc0",
"assets/assets/data/path_119.json": "373ad94dfa2273a788390bc9bdcd50b7",
"assets/assets/data/path_120.json": "e835e9ed36a79978a2f08b138ec67253",
"assets/assets/images/apple.png": "970081517322e7da8a29be1ee4f511ee",
"assets/assets/images/apple_land_map.png": "b21d8c86b3d05abc81502318e7081082",
"assets/assets/images/bushcraft.jpg": "14f1929e492977ecd39414d7ad3cad0b",
"assets/assets/images/free_time.jpg": "d35dc53c3707077e053f9e504a6357e9",
"assets/assets/images/get_to_know.jpg": "6dcbc5e6c484b8a919facc197570bfd1",
"assets/assets/images/ice_break.jpg": "065e21a7630c79810d30125d717e8636",
"assets/assets/images/local_culture_history_setting_up_camp.jpg": "4b9d74719c38bae6390b5bf00506739c",
"assets/assets/images/make_the_camp_better.jpg": "6dcbc5e6c484b8a919facc197570bfd1",
"assets/assets/images/moot_logo.png": "7c07f016a4d062b190bdcc2b0197b38f",
"assets/assets/images/peddy_papper.jpg": "0899d012fbcf7c9c6493ff50382c66b2",
"assets/assets/images/pool_activity.jpg": "9f3eafddfd6361b3ef846d102a96df9e",
"assets/assets/images/portuguese_party.jpg": "3e8fb9245ed3362a514e15876d608a1f",
"assets/assets/images/prepare_fire_camp.jpg": "d35dc53c3707077e053f9e504a6357e9",
"assets/assets/images/program_craft_a_zingaro.jpg": "55ee65b27e24eed721141053ad62410a",
"assets/assets/images/train_trip.jpg": "87e018f4e68e895b507c3b96e2aa4dfb",
"assets/assets/images/trip_carrazeda.jpg": "6dcbc5e6c484b8a919facc197570bfd1",
"assets/assets/images/trip_main_camp.jpg": "87e018f4e68e895b507c3b96e2aa4dfb",
"assets/assets/images/valley_trail.jpg": "52c24737b97547ea5585855f220514fa",
"assets/assets/images/water_games.jpg": "4b6f08f895f2346adba6dbec8ea30d9d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "76890917e7705b427c642fbc232d8109",
"assets/NOTICES": "5ec158ffd59153a9ee5c1d99c569278d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "0f5770e56876b1de407b0e62533a01e3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "20219335ed1f82a7bf82fed7d47f582e",
"/": "20219335ed1f82a7bf82fed7d47f582e",
"main.dart.js": "e2df1afd4cc0a2472e5e01da0e1eb288",
"manifest.json": "781023a1bd67b5a93633d75f5a7696f2",
"version.json": "e15f4712c64d597ca21a1a9ca720ba85"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
