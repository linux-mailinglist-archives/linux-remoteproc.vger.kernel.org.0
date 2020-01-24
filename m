Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E8114794C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 24 Jan 2020 09:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgAXIYT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 24 Jan 2020 03:24:19 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58732 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAXIYT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Jan 2020 03:24:19 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 8570527E06A1;
        Fri, 24 Jan 2020 09:24:17 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Dv5XQasumsM2; Fri, 24 Jan 2020 09:24:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 53D6227E0BA4;
        Fri, 24 Jan 2020 09:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 53D6227E0BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1579854256;
        bh=Z1LqPTE7Pmd18OfvzrN+IAn6isrYOfdJ/gtgYQCUhKg=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=BMKCk2M6BItVc5/z92MDxdskVcvTVURBl8bnlbQaJwj+tiemHg0e/3t7bBeD+OoFv
         SSG+ip4XjPE4j9sGZh42Y9UUd1OSxmDrenfex13wwWlcWhVyVoEQXEH16+TTgd0kAQ
         YtjRnld4qFT5iMETK6O0ThzkEif5h5wr1h/VHWUY=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vntIO5-01QkH; Fri, 24 Jan 2020 09:24:16 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 3AE4727E06A1;
        Fri, 24 Jan 2020 09:24:16 +0100 (CET)
Date:   Fri, 24 Jan 2020 09:24:16 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>
Message-ID: <416367983.521160.1579854256209.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200124005309.GA30148@xps15>
References: <20190819114516.28665-1-cleger@kalray.eu> <20191004184220.24817-1-cleger@kalray.eu> <20200124005309.GA30148@xps15>
Subject: Re: [PATCH v2] remoteproc: Add elf64 support in elf loader
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Add elf64 support in elf loader
Thread-Index: J9zaZekZJZJ0fl+KQwqqGf0MyEggrA==
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

----- On 24 Jan, 2020, at 01:53, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> Hi Clement,
>=20
> On Fri, Oct 04, 2019 at 08:42:20PM +0200, Clement Leger wrote:
>> elf32 and elf64 mainly differ by their types. In order to avoid
>> copy/pasting the whole loader code, generate static inline functions
>> which will access values according to the elf class. It allows to keep a
>> common loader basis.
>> In order to accomodate both elf types sizes, the maximum size for a
>> elf header member is chosen using the maximum value of both elf class.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
>> ---
>> Changes in v2:
>>  - Add ELF64 support in documentation
>>
>=20
> First and foremost please address the complaints from checkpatch.

I fixed one typo in accommodate. The other checkpatch complaint is
about missing parenthesis for macros with complex values which is
unfortunately not possible since I'm generating inline functions.

Did you have any other one ?

>=20
>> ---
>>  Documentation/remoteproc.txt               |   2 +-
>>  drivers/remoteproc/remoteproc_elf_loader.c | 135 ++++++++++++++++++----=
-------
>>  drivers/remoteproc/remoteproc_elf_loader.h |  69 +++++++++++++++
>>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>>  drivers/remoteproc/st_remoteproc.c         |   2 +-
>>  include/linux/remoteproc.h                 |   4 +-
>>  6 files changed, 157 insertions(+), 57 deletions(-)
>>  create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h
>>=20
>> diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
>> index 77fb03acdbb4..bf4f0c41ec4e 100644
>> --- a/Documentation/remoteproc.txt
>> +++ b/Documentation/remoteproc.txt
>> @@ -230,7 +230,7 @@ in the used rings.
>>  Binary Firmware Structure
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> =20
>> -At this point remoteproc only supports ELF32 firmware binaries. However=
,
>> +At this point remoteproc supports ELF32 and ELF64 firmware binaries. Ho=
wever,
>>  it is quite expected that other platforms/devices which we'd want to
>>  support with this framework will be based on different binary formats.
>> =20
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
>> b/drivers/remoteproc/remoteproc_elf_loader.c
>> index b17d72ec8603..6a2d31d6092c 100644
>> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> @@ -31,6 +31,7 @@
>>  #include <linux/elf.h>
>> =20
>>  #include "remoteproc_internal.h"
>> +#include "remoteproc_elf_loader.h"
>> =20
>>  /**
>>   * rproc_elf_sanity_check() - Sanity Check ELF firmware image
>> @@ -43,8 +44,16 @@ int rproc_elf_sanity_check(struct rproc *rproc, const=
 struct
>> firmware *fw)
>>  {
>>  =09const char *name =3D rproc->firmware;
>>  =09struct device *dev =3D &rproc->dev;
>> +=09/*
>> +=09 * Elf files are beginning with the same structure. Thus, to simplif=
y
>> +=09 * header parsing, we can use the elf32_hdr one for both elf64 and
>> +=09 * elf32.
>> +=09 */
>>  =09struct elf32_hdr *ehdr;
>> +=09u32 elf_shdr_size;
>> +=09u64 phoff, shoff;
>>  =09char class;
>> +=09u16 phnum;
>> =20
>>  =09if (!fw) {
>>  =09=09dev_err(dev, "failed to load %s\n", name);
>> @@ -58,9 +67,13 @@ int rproc_elf_sanity_check(struct rproc *rproc, const=
 struct
>> firmware *fw)
>=20
> In the current code [1] fw->size is compared against the size of an elf32=
_hdr.
> If support for elf64 is added that code needs to be modified to check for=
 the
> right header size using fw_elf_get_class().

Actually, the elf32 header is smaller than the elf64 one so this check is
there to ensure that we have at least a minimal elf header (elf32).
And since the class is derived from the header, you better have to check th=
e
header size before accessing it.

To be more clear, I could compare it to min(sizeof(struct elf32_hdr),
sizeof(struct elf64_hdr)) or add a comment at least stating that since
elf header contains the same fields for identification, we can use the=20
elf32 one.

>=20
> [1]
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/remoteproc/remot=
eproc_elf_loader.c#L46
>=20
>> =20
>>  =09ehdr =3D (struct elf32_hdr *)fw->data;
>> =20
>> -=09/* We only support ELF32 at this point */
>> +=09if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
>> +=09=09dev_err(dev, "Image is corrupted (bad magic)\n");
>> +=09=09return -EINVAL;
>> +=09}
>> +
>=20
> Is there a reason to move this check up where?  If not please bring it ba=
ck to
> its original location, that is below:
>=20
> "if (fw->size < ehdr->e_shoff + sizeof(structelf32_shdr))"
>=20

This is because the new check for size uses elf_shdr_size which is derived =
from
the class. And since the class is extracted from the elf header, we need to=
 check
the header to be correct first.

>>  =09class =3D ehdr->e_ident[EI_CLASS];
>> -=09if (class !=3D ELFCLASS32) {
>> +=09if (class !=3D ELFCLASS32 && class !=3D ELFCLASS64) {
>>  =09=09dev_err(dev, "Unsupported class: %d\n", class);
>>  =09=09return -EINVAL;
>>  =09}
>> @@ -75,26 +88,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, cons=
t struct
>> firmware *fw)
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
>> -=09=09dev_err(dev, "Image is too small\n");
>> -=09=09return -EINVAL;
>> -=09}
>> +=09phoff =3D elf_hdr_e_phoff(class, fw->data);
>> +=09shoff =3D elf_hdr_e_shoff(class, fw->data);
>> +=09phnum =3D  elf_hdr_e_phnum(class, fw->data);
>> +=09elf_shdr_size =3D elf_size_of_shdr(class);
>> =20
>> -=09if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
>> -=09=09dev_err(dev, "Image is corrupted (bad magic)\n");
>> +=09if (fw->size < shoff + elf_shdr_size) {
>> +=09=09dev_err(dev, "Image is too small\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (ehdr->e_phnum =3D=3D 0) {
>> +=09if (phnum =3D=3D 0) {
>>  =09=09dev_err(dev, "No loadable segments\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> -=09if (ehdr->e_phoff > fw->size) {
>> +=09if (phoff > fw->size) {
>>  =09=09dev_err(dev, "Firmware size is too small\n");
>>  =09=09return -EINVAL;
>>  =09}
>> =20
>> +=09dev_dbg(dev, "Firmware is an elf%d file\n",
>> +=09=09class =3D=3D ELFCLASS32 ? 32 : 64);
>> +
>=20
> Yes, this is useful.
>=20
>>  =09return 0;
>>  }
>>  EXPORT_SYMBOL(rproc_elf_sanity_check);
>> @@ -110,11 +126,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>>   * Note that the boot address is not a configurable property of all rem=
ote
>>   * processors. Some will always boot at a specific hard-coded address.
>>   */
>> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw)
>> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw)
>>  {
>> -=09struct elf32_hdr *ehdr  =3D (struct elf32_hdr *)fw->data;
>> -
>> -=09return ehdr->e_entry;
>> +=09return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
>>  }
>>  EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>> =20
>> @@ -145,37 +159,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
>>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware =
*fw)
>>  {
>>  =09struct device *dev =3D &rproc->dev;
>> -=09struct elf32_hdr *ehdr;
>> -=09struct elf32_phdr *phdr;
>> +=09const void *ehdr, *phdr;
>>  =09int i, ret =3D 0;
>> +=09u16 phnum;
>>  =09const u8 *elf_data =3D fw->data;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09u32 elf_phdr_size =3D elf_size_of_phdr(class);
>> =20
>> -=09ehdr =3D (struct elf32_hdr *)elf_data;
>> -=09phdr =3D (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
>> +=09ehdr =3D elf_data;
>> +=09phnum =3D elf_hdr_e_phnum(class, ehdr);
>> +=09phdr =3D elf_data + elf_hdr_e_phoff(class, ehdr);
>> =20
>>  =09/* go through the available ELF segments */
>> -=09for (i =3D 0; i < ehdr->e_phnum; i++, phdr++) {
>> -=09=09u32 da =3D phdr->p_paddr;
>> -=09=09u32 memsz =3D phdr->p_memsz;
>> -=09=09u32 filesz =3D phdr->p_filesz;
>> -=09=09u32 offset =3D phdr->p_offset;
>> +=09for (i =3D 0; i < phnum; i++, phdr +=3D elf_phdr_size) {
>> +=09=09u64 da =3D elf_phdr_p_paddr(class, phdr);
>> +=09=09u64 memsz =3D elf_phdr_p_memsz(class, phdr);
>> +=09=09u64 filesz =3D elf_phdr_p_filesz(class, phdr);
>> +=09=09u64 offset =3D elf_phdr_p_offset(class, phdr);
>> +=09=09u32 type =3D elf_phdr_p_type(class, phdr);
>>  =09=09void *ptr;
>> =20
>> -=09=09if (phdr->p_type !=3D PT_LOAD)
>> +=09=09if (type !=3D PT_LOAD)
>>  =09=09=09continue;
>> =20
>> -=09=09dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
>> -=09=09=09phdr->p_type, da, memsz, filesz);
>> +=09=09dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\=
n",
>> +=09=09=09type, da, memsz, filesz);
>> =20
>>  =09=09if (filesz > memsz) {
>> -=09=09=09dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
>> +=09=09=09dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
>>  =09=09=09=09filesz, memsz);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>>  =09=09}
>> =20
>>  =09=09if (offset + filesz > fw->size) {
>> -=09=09=09dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
>> +=09=09=09dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
>>  =09=09=09=09offset + filesz, fw->size);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>> @@ -184,14 +202,15 @@ int rproc_elf_load_segments(struct rproc *rproc, c=
onst
>> struct firmware *fw)
>>  =09=09/* grab the kernel address for this device address */
>>  =09=09ptr =3D rproc_da_to_va(rproc, da, memsz);
>>  =09=09if (!ptr) {
>> -=09=09=09dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
>> +=09=09=09dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
>> +=09=09=09=09memsz);
>>  =09=09=09ret =3D -EINVAL;
>>  =09=09=09break;
>>  =09=09}
>> =20
>>  =09=09/* put the segment where the remote processor expects it */
>> -=09=09if (phdr->p_filesz)
>> -=09=09=09memcpy(ptr, elf_data + phdr->p_offset, filesz);
>> +=09=09if (filesz)
>> +=09=09=09memcpy(ptr, elf_data + offset, filesz);
>> =20
>>  =09=09/*
>>  =09=09 * Zero out remaining memory for this segment.
>> @@ -208,24 +227,32 @@ int rproc_elf_load_segments(struct rproc *rproc, c=
onst
>> struct firmware *fw)
>>  }
>>  EXPORT_SYMBOL(rproc_elf_load_segments);
>> =20
>> -static struct elf32_shdr *
>> -find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
>> +static const void *
>=20
> Not sure I understand the "const" - was the compiler complaining?

It's actually caused by the fact I used a const void* shdr in the caller.
I will check if this is mandatory.

>=20
>> +find_table(struct device *dev, const struct firmware *fw)
>>  {
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr, *name_table_shdr;
>>  =09int i;
>>  =09const char *name_table;
>>  =09struct resource_table *table =3D NULL;
>> -=09const u8 *elf_data =3D (void *)ehdr;
>> +=09const u8 *elf_data =3D (void *)fw->data;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09size_t fw_size =3D fw->size;
>> +=09const void *ehdr =3D elf_data;
>> +=09u16 shnum =3D elf_hdr_e_shnum(class, ehdr);
>> +=09u32 elf_shdr_size =3D elf_size_of_shdr(class);
>> +=09u16 shstrndx =3D elf_hdr_e_shstrndx(class, ehdr);
>> =20
>>  =09/* look for the resource table and handle it */
>> -=09shdr =3D (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
>> -=09name_table =3D elf_data + shdr[ehdr->e_shstrndx].sh_offset;
>> +=09shdr =3D elf_data + elf_hdr_e_shoff(class, ehdr);
>> +=09name_table_shdr =3D shdr + (shstrndx * elf_shdr_size);
>> +=09name_table =3D elf_data + elf_shdr_sh_offset(class, name_table_shdr)=
;
>=20
> It took me a while but I figured out what is happening here.  To save me =
(and
> other people) from going through the same mental process every time I loo=
k at
> this code, please add a comment for each of the above 3 lines.

Indeed.

>=20
>> =20
>> -=09for (i =3D 0; i < ehdr->e_shnum; i++, shdr++) {
>> -=09=09u32 size =3D shdr->sh_size;
>> -=09=09u32 offset =3D shdr->sh_offset;
>> +=09for (i =3D 0; i < shnum; i++, shdr +=3D elf_shdr_size) {
>> +=09=09u64 size =3D elf_shdr_sh_size(class, shdr);
>> +=09=09u64 offset =3D elf_shdr_sh_offset(class, shdr);
>> +=09=09u32 name =3D elf_shdr_sh_name(class, shdr);
>> =20
>> -=09=09if (strcmp(name_table + shdr->sh_name, ".resource_table"))
>> +=09=09if (strcmp(name_table + name, ".resource_table"))
>>  =09=09=09continue;
>> =20
>>  =09=09table =3D (struct resource_table *)(elf_data + offset);
>> @@ -279,21 +306,21 @@ find_table(struct device *dev, struct elf32_hdr *e=
hdr,
>> size_t fw_size)
>>   */
>>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware=
 *fw)
>>  {
>> -=09struct elf32_hdr *ehdr;
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr;
>>  =09struct device *dev =3D &rproc->dev;
>>  =09struct resource_table *table =3D NULL;
>>  =09const u8 *elf_data =3D fw->data;
>>  =09size_t tablesz;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> +=09u64 sh_offset;
>> =20
>> -=09ehdr =3D (struct elf32_hdr *)elf_data;
>> -
>> -=09shdr =3D find_table(dev, ehdr, fw->size);
>> +=09shdr =3D find_table(dev, fw);
>>  =09if (!shdr)
>>  =09=09return -EINVAL;
>> =20
>> -=09table =3D (struct resource_table *)(elf_data + shdr->sh_offset);
>> -=09tablesz =3D shdr->sh_size;
>> +=09sh_offset =3D elf_shdr_sh_offset(class, shdr);
>> +=09table =3D (struct resource_table *)(elf_data + sh_offset);
>> +=09tablesz =3D elf_shdr_sh_size(class, shdr);
>> =20
>>  =09/*
>>  =09 * Create a copy of the resource table. When a virtio device starts
>> @@ -326,13 +353,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
>>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc,
>>  =09=09=09=09=09=09       const struct firmware *fw)
>>  {
>> -=09struct elf32_hdr *ehdr =3D (struct elf32_hdr *)fw->data;
>> -=09struct elf32_shdr *shdr;
>> +=09const void *shdr;
>> +=09u64 sh_addr, sh_size;
>> +=09u8 class =3D fw_elf_get_class(fw);
>> =20
>> -=09shdr =3D find_table(&rproc->dev, ehdr, fw->size);
>> +=09shdr =3D find_table(&rproc->dev, fw);
>>  =09if (!shdr)
>>  =09=09return NULL;
>> =20
>> -=09return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
>> +=09sh_addr =3D elf_shdr_sh_addr(class, shdr);
>> +=09sh_size =3D elf_shdr_sh_size(class, shdr);
>> +
>> +=09return rproc_da_to_va(rproc, sh_addr, sh_size);
>=20
> The prototype for the above is as follow:
>=20
> void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>=20
> But sh_size is a u64, which will cause problem that are hard to debug.  I=
 think
> it is better to move 'len' to an 8 byte type along with the refactoring o=
f the
> existing code that is implied.  I suggest to split this work in a prepara=
tory
> patch (that will still be part of this set).

Nice catch ! I will do that.

>=20
>>  }
>>  EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.h
>> b/drivers/remoteproc/remoteproc_elf_loader.h
>> new file mode 100644
>> index 000000000000..fac3565734f9
>> --- /dev/null
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.h
>> @@ -0,0 +1,69 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Remote processor elf loader defines
>> + *
>> + * Copyright (C) 2019 Kalray, Inc.
>> + */
>> +
>> +#ifndef REMOTEPROC_ELF_LOADER_H
>> +#define REMOTEPROC_ELF_LOADER_H
>> +
>> +#include <linux/elf.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * fw_elf_get_class - Get elf class
>> + * @fw: the ELF firmware image
>> + *
>> + * Note that we use and elf32_hdr to access the class since the start o=
f the
>> + * struct is the same for both elf class
>> + *
>> + * Return: elf class of the firmware
>> + */
>> +static inline u8 fw_elf_get_class(const struct firmware *fw)
>> +{
>> +=09struct elf32_hdr *ehdr =3D (struct elf32_hdr *)fw->data;
>> +
>> +=09return ehdr->e_ident[EI_CLASS];
>> +}
>> +
>> +#define ELF_GET_FIELD(__s, __field, __type) \
>> +static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
>> +{ \
>> +=09if (class =3D=3D ELFCLASS32) \
>> +=09=09return (__type) ((const struct elf32_##__s *) arg)->__field; \
>> +=09else \
>> +=09=09return (__type) ((const struct elf64_##__s *) arg)->__field; \
>> +}
>> +
>> +ELF_GET_FIELD(hdr, e_entry, u64)
>> +ELF_GET_FIELD(hdr, e_phnum, u16)
>> +ELF_GET_FIELD(hdr, e_shnum, u16)
>> +ELF_GET_FIELD(hdr, e_phoff, u64)
>> +ELF_GET_FIELD(hdr, e_shoff, u64)
>> +ELF_GET_FIELD(hdr, e_shstrndx, u16)
>> +
>> +ELF_GET_FIELD(phdr, p_paddr, u64)
>> +ELF_GET_FIELD(phdr, p_filesz, u64)
>> +ELF_GET_FIELD(phdr, p_memsz, u64)
>> +ELF_GET_FIELD(phdr, p_type, u32)
>> +ELF_GET_FIELD(phdr, p_offset, u64)
>> +
>> +ELF_GET_FIELD(shdr, sh_size, u64)
>> +ELF_GET_FIELD(shdr, sh_offset, u64)
>> +ELF_GET_FIELD(shdr, sh_name, u32)
>> +ELF_GET_FIELD(shdr, sh_addr, u64)
>=20
> I like how you did this.
>=20
>> +
>> +#define ELF_STRUCT_SIZE(__s) \
>> +static inline unsigned long elf_size_of_##__s(u8 class) \
>> +{ \
>> +=09if (class =3D=3D ELFCLASS32)\
>> +=09=09return sizeof(struct elf32_##__s); \
>> +=09else \
>> +=09=09return sizeof(struct elf64_##__s); \
>> +}
>> +
>> +ELF_STRUCT_SIZE(shdr)
>> +ELF_STRUCT_SIZE(phdr)
>> +
>> +#endif /* REMOTEPROC_ELF_LOADER_H */
>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> b/drivers/remoteproc/remoteproc_internal.h
>> index 45ff76a06c72..4ef745e3a1bc 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -63,7 +63,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
>>  int rproc_trigger_recovery(struct rproc *rproc);
>> =20
>>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *=
fw);
>> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw);
>> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware =
*fw);
>>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware =
*fw);
>>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware=
 *fw);
>>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rp=
roc,
>> diff --git a/drivers/remoteproc/st_remoteproc.c
>> b/drivers/remoteproc/st_remoteproc.c
>> index 51049d17b1e5..e23abd8a96b0 100644
>> --- a/drivers/remoteproc/st_remoteproc.c
>> +++ b/drivers/remoteproc/st_remoteproc.c
>> @@ -193,7 +193,7 @@ static int st_rproc_start(struct rproc *rproc)
>>  =09=09}
>>  =09}
>> =20
>> -=09dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
>> +=09dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
>> =20
>>  =09return 0;
>> =20
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 04d04709f2bd..512de9a2590c 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -362,7 +362,7 @@ struct rproc_ops {
>>  =09=09=09=09struct rproc *rproc, const struct firmware *fw);
>>  =09int (*load)(struct rproc *rproc, const struct firmware *fw);
>>  =09int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>> -=09u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw)=
;
>> +=09u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw)=
;
>>  };
>> =20
>>  /**
>> @@ -478,7 +478,7 @@ struct rproc {
>>  =09int num_traces;
>>  =09struct list_head carveouts;
>>  =09struct list_head mappings;
>> -=09u32 bootaddr;
>> +=09u64 bootaddr;
>>  =09struct list_head rvdevs;
>>  =09struct list_head subdevs;
>>  =09struct idr notifyids;
>=20
> Please hold off before doing another respin of this patch.  While doing
> something completely different I noticed TI also did some work in this ar=
ea.
> I'd like to take some time to look at their implementation and see if the=
y carry
> features that haven't been included here.  I intend to do this tomorrow.

Ok,

Thanks for your review,

Cl=C3=A9ment

>=20
> Thanks,
> Mathieu
>=20
>> --
>> 2.15.0.276.g89ea799
